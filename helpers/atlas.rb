module Atlas
  ATTRIBUTES = [:topology, :scale, :kind, :origin, :visibility, :usage,
    :arrangement, :perception, :stability, :reactivity]

  def enumerate(list_or_name)
    return list_or_name if list_or_name.is_a? String
    return '' unless list_or_name.is_a? Array
    return list_or_name[0] if list_or_name.count == 1
    list_or_name[0..-2].join(', ') + ' and ' + list_or_name[-1]
  end

  def article(name)
    (%w(a e i o u y).include?(name[0].downcase) ? 'an' : 'a').titlecase
  end

  def explain(network)
    a = article(network.definition.name)
    n = enumerate(network.definition.nodes)
    e = enumerate(network.definition.edges)
    m = enumerate(network.definition.mediums)
    "#{a} <strong>#{network.definition.name}</strong> consists of <em>#{n}</em> interconnected by " +
      "<em>#{e}</em> using <em>#{m}</em>."
  end

  def linked_image_tag(path, *opts)
    link_to image_tag(path, *opts), image_path(path)
  end
end
