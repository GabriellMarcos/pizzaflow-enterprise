const responseHelper = {
  success: (data, message = 'Operação realizada com sucesso') => ({
    success: true,
    message,
    data
  }),

  error: (message = 'Erro na operação', code = 400) => ({
    success: false,
    message,
    code
  }),

  paginate: (data, page, limit, total) => ({
    success: true,
    data,
    pagination: {
      page: parseInt(page),
      limit: parseInt(limit),
      total,
      pages: Math.ceil(total / limit)
    }
  })
};

module.exports = responseHelper;